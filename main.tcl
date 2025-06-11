#!/usr/bin/tclsh

set currentTime [clock seconds]
puts "Time: [clock format $currentTime -format %H:%M:%S]"
puts "Date: [clock format $currentTime -format %d/%m/%Y]"

puts "\nWelcome to a Deltora Quest text-based adventure"

# Main locations.
set main_locations {"The Forge" "The Forests of Silence" "The Lake of Tears"
"City of the Rats" "The Shifting Sands" "Dread Mountain" "The Maze of the Beast" "The Valley of the Lost"}

# Intermediary locations.
set JH "Jasmine's home"
set GD "Gorl's den"

# Entities {Health, armour, attack, gold coins, silver coins, copper coins}
set Player {1 10 10 0 10 50}
set Gorl {500 100 10 1 10 10}

set location [lindex $main_locations 0]

puts {"Health: [lindex $Player 0], Armour: [lindex $Player 1], Attack: [lindex $Player 2]"}

puts "Location: $location"
puts "Gold: [lindex $Player 3], Silver: [lindex $Player 4], Copper: [lindex $Player 5]"

set quit_var 0

while {$quit_var != "q"} {

	#after 3000 # delay for 1 seconds.
	exec clear >@ stdout
	puts [exec clear]

	set copper [lindex $Player 5]
	set health [lindex $Player 0]
	set copper [expr $copper + 1]

	# When in the forge, regenerate health
	if {$location == "The Forge" } {
	    if {$health < 100} {
			set $health [expr $health + 1]
		}
	}

	puts "Time: [clock format $currentTime -format %H:%M:%S]"
	puts "Date: [clock format $currentTime -format %d/%m/%Y]"
	puts "Location: $location"
	puts "Health: $health, Armour: [lindex $Player 1], Attack: [lindex $Player 2]"
	puts "Gold: [lindex $Player 3], Silver: [lindex $Player 4], Copper: [lindex $Player 5]"
	after 10

	# User input - Quit the game
	puts "press q to quit."
	gets stdin quit_var

}
