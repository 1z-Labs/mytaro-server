class ContentsController < ApplicationController
  # 프리뷰 이미지 가져오기
  def preview
    # content_previews 테이블에서 직접 조회
    previews = ContentPreview.where(contentId: params[:content_id])

    if previews.empty?
      head :not_found
    else
      render json: previews.map { |preview|
        {
          id: preview.id,
          imagePath: preview.imagePath,
          contentId: preview.contentId
        }
      }
    end
  end

  def chapter
    # content_chapters 테이블에서 직접 조회
    chapters = ContentChapter.where(contentId: params[:content_id]).order(:index)

    if chapters.empty?
      head :not_found
    else
      render json: chapters.map { |chapter|
        {
          id: chapter.id,
          index: chapter.index,
          chapter_content: chapter.chapters,  # 챕터 내용을 반환
          contentId: chapter.contentId
        }
      }
    end
  end


  def popular
    # 리뷰 수의 조건을 200으로 바꿀 것 (200개 이상의 후기가 증명! 컨테이너)
    contents = Content.joins(:reviews)
                              .group('contents.id')
                              .having('COUNT(reviews.id) >= ?', 5)
                              .select('contents.*, COUNT(reviews.id) as reviews_count')

    render json: contents
  end

  # 특정 id를 가진 컨텐츠를 조회하는 API (사주 상세페이지)
  def show
    # 전달받은 id 값으로 컨텐츠 찾기
    content = Content.find_by(id: params[:id])

    # 컨텐츠가 존재하지 않을 경우 404 에러 반환
    if content.nil?
      render json: { error: 'Content not found' }, status: :not_found
    else
      # 컨텐츠가 존재하면 해당 컨텐츠를 JSON 형태로 반환
      render json: content
    end
  end

  # 리뷰 수 기준으로 전체 콘텐츠를 정렬하는 API (마이타로 베스트 종합버튼)
  def index_all_by_reviews
    # 모든 콘텐츠를 가져오고, 리뷰 수 기준으로 정렬
    contents = Content
                 .left_joins(:reviews)    # 콘텐츠와 리뷰를 LEFT JOIN
                 .group('contents.id')    # 각 콘텐츠별로 그룹화
                 .order('COUNT(reviews.id) DESC')  # 리뷰 수 기준 내림차순 정렬

    # 정렬된 콘텐츠를 반환 (리뷰 수와 함께)
    render json: contents, methods: [:review_count]
  end

  # 카테고리별로 콘텐츠를 리뷰 수에 따라 정렬하는 API (마이타로 베스트(카테고리) / 솔로탈출 베스트)
  def index_by_reviews
    category_id = params[:category_id]  # 전달받은 카테고리 ID

    # 1. 해당 카테고리에 속하는 콘텐츠 가져오기
    contents = Content.joins(:content_categories)
                      .where(content_categories: { category_id: category_id })

    # 2. 리뷰 수 기준으로 콘텐츠 정렬 (reviews 테이블의 contentId를 사용)
    contents_with_reviews = contents
                              .left_joins(:reviews)     # 콘텐츠와 리뷰를 LEFT JOIN
                              .group('contents.id')     # 각 콘텐츠별로 그룹화
                              .order('COUNT(reviews.contentId) DESC')  # 리뷰 수 기준 내림차순 정렬

    # 3. 정렬된 콘텐츠를 반환 (리뷰 수와 함께)
    render json: contents_with_reviews, methods: [:review_count]
  end

  # 카테고리별로 모든 콘텐츠를 가져오는 API
  def index_by_category
    category_id = params[:category_id]  # 전달받은 카테고리 ID

    # 해당 카테고리에 속하는 모든 콘텐츠 가져오기
    contents = Content.joins(:content_categories)
                      .where(content_categories: { category_id: category_id })

    # 콘텐츠들을 반환
    render json: contents
  end
end
