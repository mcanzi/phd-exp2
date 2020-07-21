#-- HEADER --#

response_matching = simple_matching;
default_font_size = 48;
active_buttons = 2;
button_codes = 1,2;
write_codes = false;

#-- SDL --#

begin;

array {
  sound { wavefile { filename = "pi.wav"; }; description = "1"; } my_first;
  sound { wavefile { filename = "ta.wav"; }; description = "2"; };
  sound { wavefile { filename = "di.wav"; }; description = "3"; };
  sound { wavefile { filename = "du.wav"; }; description = "4"; }; } first;

array {
  sound { wavefile { filename = "pu.wav"; }; description = "5"; } my_second;
  sound { wavefile { filename = "pa.wav"; }; description = "6"; };
  sound { wavefile { filename = "pi.wav"; }; description = "7"; };
  sound { wavefile { filename = "ba.wav"; }; description = "8"; }; } second;

array {
  sound { wavefile { filename = "tu.wav"; }; description = "9"; } my_third;
  sound { wavefile { filename = "bi.wav"; }; description = "10"; };
  sound { wavefile { filename = "da.wav"; }; description = "11"; };
  sound { wavefile { filename = "pu.wav"; }; description = "12"; }; } third;

array {
  sound { wavefile { filename = "piputu.wav"; }; description = "13"; } my_control;
  sound { wavefile { filename = "tapabi.wav"; }; description = "14"; };
  sound { wavefile { filename = "dipida.wav"; }; description = "15"; };
  sound { wavefile { filename = "dubapu.wav"; }; description = "16"; }; } control;

array {
  sound { wavefile { filename = "taputu.wav"; }; description = "17"; } my_target_one;
  sound { wavefile { filename = "pipabi.wav"; }; description = "18"; };
  sound { wavefile { filename = "bapida.wav"; }; description = "19"; };
  sound { wavefile { filename = "babapu.wav"; }; description = "20"; }; } target_one; 

array {
  sound { wavefile { filename = "tiputu.wav"; }; description = "21"; } my_target_two;
  sound { wavefile { filename = "pupabi.wav"; }; description = "22"; };
  sound { wavefile { filename = "bupida.wav"; }; description = "23"; };
  sound { wavefile { filename = "bibapu.wav"; }; description = "24"; }; } target_two;

trial {
  trial_duration = 2000;
  trial_type = first_response;
  all_responses = false;
  picture {
    text {
      caption = "+"; font_size = 36; } textone;
    x = 0; y = 0; };
  stimulus_event {
    sound my_first;
    time = 0;
    response_active = true;
  } event1;
} first_trial;

trial {
  trial_duration = 2000;
  trial_type = first_response;
  all_responses = false;
  picture {
    text {
      caption = "+"; font_size = 36; };
    x = 0; y = 0; };
  stimulus_event {
    sound my_second;
    time = 0;
    response_active = true;
  } event2;
} second_trial;

trial {
  trial_duration = 5000;
  trial_type = first_response;
  all_responses = false;
  picture {
    text {
      caption = "+"; font_size = 36; };
    x = 0; y = 0; };
  stimulus_event {
    sound my_second;
    time = 0;
    response_active = true;
  } event3;
} third_trial;

trial {
  trial_duration = 4000;
  trial_type = first_response;
  all_responses = false;
  picture {
    text {
      caption = "+"; font_size = 36; } textc;
    x = 0; y = 0; };
  stimulus_event {
    sound my_second;
    time = 0;
    response_active = true;
  } event_control;
} control_trial;

trial {
  trial_duration = 4000;
  trial_type = first_response;
  all_responses = false;
  picture {
    text {
      caption = "+"; font_size = 36; } textt1;
    x = 0; y = 0; };
  stimulus_event {
    sound my_second;
    time = 0;
    response_active = true;
  } event_target_one;
} target_one_trial;

trial {
  trial_duration = 4000;
  trial_type = first_response;
  all_responses = false;
  picture {
    text {
      caption = "+"; font_size = 36; } textt2;
    x = 0; y = 0; };
  stimulus_event {
    sound my_second;
    time = 0;
    response_active = true;
  } event_target_two;
} target_two_trial;

trial {
trial_duration = 30000;
stimulus_event {
  picture {
    text { caption = "Take a break";
      font_size = 48; };
    x = 0; y = 0; };
    time = 0; duration = 25000; } break;
  stimulus_event {
  picture {
    text { caption = "Starting again in 5";
      font_size = 48; };
    x = 0; y = 0; };
    time = 25000; duration = 1000; } break5;
  stimulus_event {  
  picture {
    text { caption = "Starting again in 4";
      font_size = 48; };
    x = 0; y = 0; };
    time = 26000; duration = 1000; } break4;
  stimulus_event {
  picture {
    text { caption = "Starting again in 3";
      font_size = 48; };
    x = 0; y = 0; };
    time = 27000; duration = 1000; } break3;
  stimulus_event {
  picture {
    text { caption = "Starting again in 2";
      font_size = 48; };
    x = 0; y = 0; };
    time = 28000; duration = 1000; } break2;
  stimulus_event {
  picture {
    text { caption = "";
      font_size = 48; };
    x = 0; y = 0; };
    time = 29000; duration = 1000; } break1;
} break_trial;

#-- PCL --#

#-- Commented lines in the function below are for bebugging purposes only --#

begin_pcl;

int nrng = 0;

sub

  present_stimuli ( int rng )

begin

  string code = first[rng].description();

  event1.set_stimulus ( first[rng] );
  event1.set_event_code ( code );
  int td = random ( 975, 1025 );
# textone.set_caption(string(rng));
# textone.redraw();
  first_trial.set_duration ( td );
  first_trial.present();

  event2.set_stimulus ( second[rng] );
  event2.set_event_code ( code );
  td = random ( 975, 1025 );
  second_trial.set_duration ( td );
  second_trial.present();

  event3.set_stimulus ( third[rng] );
  event3.set_event_code ( code );
  td = random ( 2975, 3025 );
  third_trial.set_duration ( td );
  third_trial.present();

  int count1 = random ( 1,3 );

  if count1 < 3 then

    event_control.set_stimulus ( control[rng] );
    event_control.set_event_code( code );
    event_control.set_port_code ( 11 );
#   textc.set_caption("control" + string(count1));
#   textc.redraw();
    control_trial.present();

  elseif count1 == 3 then

    int count2 = random ( 1,2 );

    if count2 == 1 then

      event_target_one.set_stimulus ( target_one[rng] );
      event_target_one.set_event_code( code );
      event_target_one.set_port_code ( 22 );
#		textt1.set_caption("target" + string(count2));
#		textt1.redraw();
      target_one_trial.present();

    elseif count2 == 2 then

      event_target_two.set_stimulus ( target_two[rng] );
      event_target_two.set_event_code( code );
      event_target_two.set_port_code ( 23 );
#		textt2.set_caption("target" + string(count2));
#		textt2.redraw();
      target_two_trial.present();

    end;

  end;

end;

loop int a = 1 until a > 10 begin

  loop int b = 1 until b == 2 begin

    nrng = random ( 1,4 );
    present_stimuli ( nrng );
    b = b + 1;

  end;

  if a < 10 then

	break_trial.present();
	a = a + 1;

  end;

end;
