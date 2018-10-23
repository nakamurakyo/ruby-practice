### インプット用
total_prize       = 100000 # 総額
default_top_ratio = 0.2    # 総額に対する1位の賞金の比率
winner_number     = 100  # 賞金が配布される最大人数 (仮)

### アウトプット用
prize_list       = [total_prize * default_top_ratio]
prize_ratio_list = [default_top_ratio]
user_prize_sum   = total_prize * default_top_ratio

for rank in 2..winner_number do
  rank_ratio = default_top_ratio / rank
  rank_prize = total_prize * rank_ratio

  break if total_prize <= user_prize_sum + rank_prize

  prize_ratio_list << rank_ratio
  prize_list       << rank_prize
  user_prize_sum   += rank_prize
end

p prize_list      # 賞金額のリスト
p prize_list.size # 賞金をもらえる人数
p user_prize_sum  # 支払う賞金額の総額