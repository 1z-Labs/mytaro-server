# app/helpers/saju_helper.rb
module SajuHelper
  TEN_GAN = ['갑', '을', '병', '정', '무', '기', '경', '신', '임', '계']
  EARTHLY_BRANCHES = ['자', '축', '인', '묘', '진', '사', '오', '미', '신', '유', '술', '해']

  def saju_for(lunar_date, birthtime)
    {
      year_pillar: calculate_year_pillar(lunar_date.year),
      month_pillar: calculate_month_pillar(lunar_date.month),
      day_pillar: calculate_day_pillar(lunar_date.day),
      time_pillar: calculate_time_pillar(birthtime)
    }
  end

  private

  def calculate_year_pillar(year)
    gan_index = (year - 4) % 10
    branch_index = (year - 4) % 12
    "#{TEN_GAN[gan_index]}#{EARTHLY_BRANCHES[branch_index]}"
  end

  def calculate_month_pillar(month)
    gan_index = (month + 1) % 10
    branch_index = (month + 1) % 12
    "#{TEN_GAN[gan_index]}#{EARTHLY_BRANCHES[branch_index]}"
  end

  def calculate_day_pillar(day)
    gan_index = (day + 5) % 10
    branch_index = (day + 5) % 12
    "#{TEN_GAN[gan_index]}#{EARTHLY_BRANCHES[branch_index]}"
  end

  def calculate_time_pillar(birthtime)
    hour = birthtime.hour
    branch_index = (hour / 2) % 12
    gan_index = (hour + 1) % 10
    "#{TEN_GAN[gan_index]}#{EARTHLY_BRANCHES[branch_index]}"
  end
end
