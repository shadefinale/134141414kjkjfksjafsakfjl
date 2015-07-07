class Weapon

  attr_reader :name, :damage
  def initialize(name=nil, damage=nil)
    raise Error unless name || damage
    @name = name
    @damage = damage
    @weapon = nil
  end

end

class BattleBot

  @@count = 0

  def BattleBot.count
    return @@count
  end

  attr_reader :name, :health, :weapon, :enemies

  def initialize(name="Bot", health=100, weapon=nil)
    @name=name
    @health=health
    @weapon=weapon
    @enemies = []
    @@count += 1
  end

  def dead?
    return @health <= 0
  end

  def pick_up(weapon)
    @weapon ||= weapon
  end

  def drop_weapon
    @weapon=nil
  end

  def attack(target)
    raise Exception unless @weapon
    raise ArgumentError unless target.is_a? BattleBot
    target.take_damage(@weapon.damage)
    target.add_enemy(self)
  end

  def add_enemy(new_enemy)
    @enemies << new_enemy unless @enemies.include? (new_enemy)
  end

  def take_damage(damage)
    @health -= damage
    dead?
  end

end