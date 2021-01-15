#候補手をconst定義
$HANDS=["グー", "チョキ", "パー"]

# プレイヤー(自分)に「0 ~ 2」を入力させるロジックを書きます。
class Player
  def hand

    while true
      # 「プレイヤーに 0 ~ 2を入力させる文章」を表示させます。
      puts "数字を入力してください。"
      #puts "0:グー, 1:チョキ, 2:パー"
      $HANDS.each_with_index do |val,key|
        puts "#{key.to_s}:#{val}"
      end

      # 「input_hand」(取得した値)が「0, 1, 2」のいずれかだとwhileから脱出させ、それ以外だと初めから繰り返させます。
      # 変数「input_hand」にプレイヤーが入力したものを取得して代入します。
      # ヒント! 「getsメソッド」を使用します。
      begin
        #input_hand = gets.to_i
        input_hand = Integer(gets)
        if Range.new(0, $HANDS.length-1).include?(input_hand)
          return input_hand
        else
          puts "0〜2の数字を入力してください。"
          next
        end
      rescue ArgumentError=>ex
        puts "0〜2の数字を入力してください。"
        next
      end
    end
  end
end

class Enemy
  def hand
    # グー、チョキ、パーの値をランダムに出力させます。
    return rand(Range.new(0, $HANDS.length-1))
  end
end

class Janken

  def pon(player_hand, enemy_hand)
    #puts "相手の手は#{ $HANDS[enemy_hand] }です。"
    describe_enemy_hand="相手の手は#{ $HANDS[enemy_hand] }です。"

    if player_hand == enemy_hand
      puts "あいこ"
      #「true」を返してじゃんけんを繰り返し実行させます。
      return true

    elsif ((player_hand == 0 && enemy_hand == 1) || (player_hand == 1 && enemy_hand == 2) || (player_hand == 2 && enemy_hand == 0))
      puts "#{describe_enemy_hand}あなたの勝ちです"
      # whileを終了させる「false」を返してじゃんけんを終了させます。
      return false
    else
      puts "#{describe_enemy_hand}あなたの負けです"
      # whileを終了させる「false」を返してじゃんけんを終了させます。
      return false
    end
  end
end

player = Player.new
enemy = Enemy.new
janken = Janken.new

next_game=true
while next_game do
  return if !(next_game = janken.pon(player.hand, enemy.hand))
end
