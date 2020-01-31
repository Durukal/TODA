///player_die_state();
//get input

//calculate movement
vsp += global.grav;

//drag
hsp = lerp(hsp, 0, drag);

//stop
if abs(hsp) <= 0.5 hsp = 0;

//check state
if (image_index >= image_number - 1) {
	image_speed = 0;
	if lives <= 0 {
		o_game.game_over_lose = true;
	} else {
		//restart msg
		show_msg("Press Jump to Restart",1);
		get_input();
		if jump or attack {			
			o_game.restart = true;
			fade_to_room(room, room_start_pos_x, room_start_pos_y, room_start_facing, c_black);
			//allow instant camera panning
			with(o_camera) {
				//enable instant panning
				camera_pan_speed = 1;
				//reset camera pan speed
				alarm[CAMERA_RESET] = 3;
			}
		}
	}
}

//apply movement
collision();

//apply animations
animations();