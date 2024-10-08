# app/helpers/saju_helper.rb
module SajuHelper
  GAN = ['갑', '을', '병', '정', '무', '기', '경', '신', '임', '계']
  JI = ['자', '축', '인', '묘', '진', '사', '오', '미', '신', '유', '술', '해']
  GAN_HANJA = ['甲', '乙', '丙', '丁', '戊', '己', '庚', '辛', '壬', '癸']
  JI_HANJA = ['子', '丑', '寅', '卯', '辰', '巳', '午', '未', '申', '酉', '戌', '亥']

  def saju_for(lunar_date, birthtime)
    {
      time: calculate_time(birthtime),
      day: calculate_day(lunar_date.day),
      month: calculate_month(lunar_date.month),
      year: calculate_year(lunar_date.year),
    }
  end

  private

  def calculate_year(year)
    gan_index = (year - 4) % 10
    ji_index = (year - 4) % 12
    "#{GAN[gan_index]}#{JI[ji_index]} (#{GAN_HANJA[gan_index]}#{JI_HANJA[ji_index]})"
  end

  def calculate_month(month)
    gan_index = (month + 3) % 10
    ji_index = (month + 1) % 12
    "#{GAN[gan_index]}#{JI[ji_index]} (#{GAN_HANJA[gan_index]}#{JI_HANJA[ji_index]})"
  end

  def calculate_day(day)
    gan_index = (day + 7) % 10
    ji_index = (day - 3) % 12
    "#{GAN[gan_index]}#{JI[ji_index]} (#{GAN_HANJA[gan_index]}#{JI_HANJA[ji_index]})"
  end

  def calculate_time(birthtime)
    hour = birthtime.hour
    ji_index = (hour / 2) % 12
    gan_index = (hour / 2) % 10
    "#{GAN[gan_index]}#{JI[ji_index]} (#{GAN_HANJA[gan_index]}#{JI_HANJA[ji_index]})"
  end
end
