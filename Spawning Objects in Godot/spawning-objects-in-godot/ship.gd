extends Node2D

#the speed of the spaceship when it moves
const SPEED: float = 400

# The WHAT (part 1) - This loads the resource that contains the 
# blueprint for how to build the bullet.
@onready var bullet_blueprint: Resource = preload("res://bullet.tscn")



func spawn_bullet(gun_position) -> void:
	#The WHAT (part 2) - This actually builds the bullet using the blueprint.
	#Note it hasn't added the bullet to the scene yet, but it created it and
	#we saved it as a variable called bullet_instance.
	var bullet_instance: Node = bullet_blueprint.instantiate()
	
	#The WHEN - Now we add the bullet instance to the scene using add_child.
	#Wherever you put add_child is when the actual bullet spawns. In this
	#example, we placed it in our spawn_bullet function so it spawns when we call it.
	add_child(bullet_instance)
	
	#The WHERE (part 1) - Now we use set_position to tell the bullet where to spawn.
	#notice that we haven't given it the coordinates yet, but instead used a 
	#parameter in our spawn_bullet function. This way, we can decide position
	#each time we want to spawn a bullet instead of being locked in to one position.
	bullet_instance.set_position(gun_position)
	
	
# moves the spaceship using SPEED
func move_spaceship(delta):
	var horizontal_input: float = Input.get_axis("ui_left", "ui_right")
	var vertical_input: float = Input.get_axis("ui_up", "ui_down")
	$SpaceshipSprite.position += SPEED * delta * Vector2(horizontal_input, vertical_input)

func _process(delta):
	if Input.is_action_just_pressed("spacebar"):
		spawn_bullet($SpaceshipSprite/Guns/GunPosition1.global_position)
		spawn_bullet($SpaceshipSprite/Guns/GunPosition2.global_position)
		spawn_bullet($SpaceshipSprite/Guns/GunPosition3.global_position)
		spawn_bullet($SpaceshipSprite/Guns/GunPosition4.global_position)



#BONUS: I commented this out, but this is a different way to shoot all 4 guns. 
#can you figure out how it works?

	#if Input.is_action_just_pressed("spacebar"):
		#for gun in $SpaceshipSprite/Guns.get_children():
			#spawn_bullet(gun.global_position)


	move_spaceship(delta)
