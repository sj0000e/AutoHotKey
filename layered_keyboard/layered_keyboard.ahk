#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
;//////////////////////////////////////////////////////////////
; initialization
; env variables
;//////////////////////////////////////////////////////////////
#SingleInstance Force ; Allow only one running instance of script.
CoordMode, ToolTip, Screen  ; Place ToolTips at absolute screen coordinates:
current_layer := "layer_normal"

;//////////////////////////////////////////////////////////////
; env variables
;//////////////////////////////////////////////////////////////

mouse_move_max_distance := 50
mouse_move_accelation_ratio := 0.05
mouse_move_distance_start := 2
mouse_move_distance_double := 15
mouse_move_distance := mouse_move_distance_start

noti_png := 0
noti_x := A_ScreenWidth//2-400
noti_y := A_ScreenHeight//2-100

;//////////////////////////////////////////////////////////////
; notications
;//////////////////////////////////////////////////////////////
PopUp(msg){
  global noti_png
  if(noti_png = 1) {
    SplashImage,  %msg%.png
  }
  else{
    global noti_x
    global noti_y
    Tooltip, % "`n`n`t`t " . msg . "`t`t`t`n`n ", %noti_x%, %noti_y%
    ; SetTimer, RemoveToolTip, %tooltip_duration%
  }
  SetTimer, RemoveSplash, -1000
  SetTimer, RemoveToolTip, -1000
}

RemoveToolTip:
ToolTip
return
RemoveSplash:
SplashImage,Off
return
SetLayer(new_layer){
  global current_layer
  Send, {Shift Up}{Alt Up}{Ctrl Up}
  current_layer := new_layer
  PopUp(new_layer)
}
return

;//////////////////////////////////////////////////////////////
; all layer
; LControl = layer 0 (Normal)
; LShift = layer 1 (Navigation)
; RShift = layer 2 (Function), 3 (Numpad)
; normal http://www.keyboard-layout-editor.com/##@@=~%0A%60&=!%0A1&=%2F@%0A2&=%23%0A3&=$%0A4&=%25%0A5&=%5E%0A6&=%2F&%0A7&=*%0A8&=(%0A9&=)%0A0&=%2F_%0A-&=+%0A%2F=&_w:2%3B&=Backspace%3B&@_w:1.5%3B&=Tab&=Q&=W&=E&=R&=T&=Y&=U&=I&=O&=P&=%7B%0A%5B&=%7D%0A%5D&_w:1.5%3B&=%7C%0A%5C%3B&@_w:1.75%3B&=LCtrl%0ANormal&=A&=S&=D&=F&=G&=H&=J&=K&=L&=%2F:%0A%2F%3B&=%22%0A'&_w:2.25%3B&=Enter%3B&@_w:2.25%3B&=Shift&=Z&=X&=C&=V&=B&=N&=M&=%3C%0A,&=%3E%0A.&=%3F%0A%2F%2F&_w:2.75%3B&=Shift%0AVimNormal%3B&@_w:1.25%3B&=Ctrl&_w:1.25%3B&=Win&_w:1.25%3B&=Alt&_a:7&w:6.25%3B&=&_a:4&w:1.25%3B&=Alt&_w:1.25%3B&=Win&_w:1.25%3B&=Menu&_w:1.25%3B&=Ctrl
; vim_normal http://www.keyboard-layout-editor.com/##@@=~%0A%60%0A%0A%0A%0A%0AESC&=!%0A1&=%2F@%0A2&=%23%0A3&=$%0AEnd&=%25%0A5&=Home%0A6&=%0A7&=*%0A8&=(%0A9&=)%0AHome&=%2F_%0A-&=+%0A%2F=&_w:2%3B&=Backspace%3B&@_w:1.5%3B&=Tab%0ANumber&=Q&=W&=E&=R&=T&=Y%0ACtrl+c&=U%0ACtrl+z&=I%0Avim%2F_insert&=O&=P%0ACtrl+v&=%7B%0A%5B&=%7D%0A%5D&_w:1.5%3B&=%7C%0A%5C%3B&@_w:1.75%3B&=LCtrl%0ANormal&=A%0Avim%2F_insert&=S&=D&=F%0A%0A%0A%0A%0A%0A%0A%0A%0APgDn&=G&=H%0A%E2%86%90&=J%0A%E2%86%91&=K%0A%E2%86%93&=L%0A%E2%86%92&=%2F:%0A%2F%3B&=%22%0A'&_w:2.25%3B&=Enter%3B&@_w:2.25%3B&=Shift%0AMouse&=Z&=Backspace%0ADelete&=C&=V&=B%0A%0A%0A%0A%0A%0A%0A%0A%0APgUp&=shift+F3%0AF3&=M%0AMenu&=%3C%0A,&=%3E%0A.&=%0ACtrl+F&_w:2.75%3B&=Shift%0AVim%2F_Normal%3B&@_w:1.25%3B&=Ctrl&_w:1.25%3B&=Win&_w:1.25%3B&=Alt&_a:7&w:6.25%3B&=&_a:4&w:1.25%3B&=Alt&_w:1.25%3B&=Win&_w:1.25%3B&=Menu&_w:1.25%3B&=Ctrl
; Num http://www.keyboard-layout-editor.com/##@@=~%0A%60&=!%0A1&=%2F@%0A2&=%23%0A3&=$%0A4&=%25%0A5&=%5E%0A6&=%2F&%0A7&=*%0A8&=(%0A9&=)%0A0&=%2F_%0A-&=+%0A%2F=&_w:2%3B&=Backspace%3B&@_w:1.5%3B&=Tab&=Q%0AF1&=W%0AF2&=E%0AF3&=R%0AF4&=T%0AF5&=Y%0AF6&=U%0AF7&=I%0AF8&=O%0AF9&=P%0AF10&=%7B%0AF11&=%7D%0AF12&_w:1.5%3B&=%7C%0A%5C%3B&@_w:1.75%3B&=LCtrl%0ANormal&=A%0A1&=S%0A2&=D%0A3&=F%0A4&=G%0A5&=H%0A6&=J%0A7&=K%0A8&=L%0A9&=%2F%3B%0A0&=%22%0A%2F=&_w:2.25%3B&=Enter%3B&@_w:2.25%3B&=Shift%0AMouse&=Z&=X&=C&=V&=B&=N&=M%0A-&=%3C%0A,&=%3E%0A.&=%3F%0A%2F%2F&_w:2.75%3B&=Shift%0AVim%2F_Normal%3B&@_w:1.25%3B&=Ctrl&_w:1.25%3B&=Win&_w:1.25%3B&=Alt&_a:7&w:6.25%3B&=&_a:4&w:1.25%3B&=Alt&_w:1.25%3B&=Win&_w:1.25%3B&=Menu&_w:1.25%3B&=Ctrl
; Mouse http://www.keyboard-layout-editor.com/##@@=~%0A%60%0A%0A%0A%0A%0AESC&=!%0A1&=%2F@%0A2&=%23%0A3&=$%0A4&=%25%0A5&=%5E%0A6&=%0A7&=*%0A8&=(%0A9&=)%0AHome&=%2F_%0A-&=+%0A%2F=&_w:2%3B&=Backspace%3B&@_w:1.5%3B&=Tab%0ANumber&=Q&=W&=E&=R&=T%0AWheelUp&=Y&=U&=I%0Avim%2F_insert&=O&=P&=%7B%0A%5B&=%7D%0A%5D&_w:1.5%3B&=%7C%0A%5C%3B&@_w:1.75%3B&=LCtrl%0ANormal&=A%0Avim%2F_insert&=S&=D&=F%0A%0A%0A%0A%0A%0A%0A%0A%0APgDn&=G%0AWheelDown&=H%0A%E2%86%90&=J%0A%E2%86%91&=K%0A%E2%86%93&=L%0A%E2%86%92&=%2F:%0A%E2%86%90&=%22%0A'&_w:2.25%3B&=Enter%3B&@_w:2.25%3B&=Shift%0AMouse&=Z&=X&=C&=V&=B%0A%0A%0A%0A%0A%0A%0A%0A%0APgUp&=N%0AWheelDown&=M%0AWheelUp&=%3C%0A,&=%3E%0A.&=%0ACtrl+F&_w:2.75%3B&=Shift%0AVim%2F_Normal%3B&@_w:1.25%3B&=Ctrl&_w:1.25%3B&=Win&_w:1.25%3B&=Alt&_a:7&w:6.25%3B&=&_a:4&w:1.25%3B&=Alt&_w:1.25%3B&=Win&_w:1.25%3B&=Menu&_w:1.25%3B&=Ctrl
;//////////////////////////////////////////////////////////////
CapsLock::LControl

$LControl:: ; short tap trigger
  Send,{LControl Down} 
  KeyWait, LControl, t0.15 ; t0.x = short click time
  If ErrorLevel  {
    KeyWait, LControl
  }
  Else If(A_PriorKey = "LControl") { ;check prior key
    SetLayer("layer_normal")
  }
  Send,{LControl Up}
  Return

$Rshift:: ; short tap trigger
  Send,{Rshift Down} 
  KeyWait, Rshift, t0.2 ; t0.x = short click time
  If ErrorLevel  {
    KeyWait, Rshift
  }
  Else If(A_PriorKey = "Rshift") { ;check prior key
    If (0){ ; current_layer!="layer_normal") {
      SetLayer("layer_normal")
    }
    Else{
      SetLayer("layer_vim_normal")
    }
  }
  Send,{Rshift Up}
  Return


;//////////////////////////////////////////////////////////////
; layer_vim_normal commands
;//////////////////////////////////////////////////////////////
#If current_layer="layer_vim_normal"
  ;SC029::Escape ; `
  ;1::
  ;2::
  ;3::
  ;4::
  ;5::
  ;6::return
  ^::Home
  ;7::
  ;8::
  ;9::return
  0::Home
  q::return
  w::^Right
  e::
  r::
  t::return
  y::Send, ^c
  u::^z
  i::SetLayer("layer_vim_insert")
  o::return
  p::^v
  [::
  ]::
  \::return
  a::SetLayer("layer_vim_insert")
  s::return
  ;d::
  ;f::return
  ^f::Send,{PgDn}
  g::return
  h::Left
  k::Up
  j::Down
  l::Right
  z::return
  ;x::Send, {Shift Down}{Right}{Shift Up}^x
  ;+x::Send, {Shift Down}{Left}{Shift Up}^x
  c::return
  v::
    SetLayer("layer_vim_visual")
    Send, {Shift Down}{Right}
    return
  ;^v::
  ;  SetLayer("layer_vim_visual")
  ;  Send, {Shift Down}{Alt Down}{Right}
  ;  return
  b::^Left
  ^b::Send,{PgUp}
  n::F3
  +n::+F3
  m::AppsKey
  $::End
  /::^f
  ?::^f

;custom
  SC029::Escape ; `
  ^w::^w
  ^x::^x
  x::Delete
  +x::BackSpace
  *::Send,{Ctrl Down}{Left}{Shift Down}{Rig<<ht}{Ctrl Up}{Shift Up}
  
  tab::SetLayer("layer_number")
  
  $Lshift:: ; short tap trigger
    Send,{Lshift Down} 
    KeyWait, Lshift, t0.15 ; t0.x = short click time
    If ErrorLevel  {
      KeyWait, Lshift
    }
    Else If(A_PriorKey = "LShift") { ;check prior key
      SetLayer("layer_mouse")
    }
    Send,{Lshift Up}
    Return


return ; layer_vim_normal



;//////////////////////////////////////////////////////////////
; layer_vim_insert commands
;//////////////////////////////////////////////////////////////

#If current_layer="layer_vim_insert"
*Esc::
^[::SetLayer("layer_vim_normal")

$Lshift:: ; short tap trigger
  Send,{Lshift Down} 
  KeyWait, Lshift, t0.15 ; t0.x = short click time
  If ErrorLevel  {
    KeyWait, Lshift
  }
  Else If(A_PriorKey = "LShift") { ;check prior key
    SetLayer("layer_mouse")
  }
  Send,{Lshift Up}
  Return

return ; layer_vim_insert



;//////////////////////////////////////////////////////////////
; layer_vim_visual commands
;//////////////////////////////////////////////////////////////

#If current_layer="layer_vim_visual"
  *Esc::SetLayer("layer_vim_normal")
  ^[::SetLayer("layer_vim_normal")
  *q::return
  *w::^Right
  *e::
  *r::
  *t::return
  *y::
    SetLayer("layer_vim_normal")
    Send, ^c
    return
  *u::return
  *i::SetLayer("layer_vim_insert")
  *o::
  *p::
  *a::
  *s::
  *d::return
  *^f::Send,{PgDn}
  *f::return
  *g::return
  *h::Left
  *k::Up
  *j::Down
  *l::Right
  *z::return
  *x::
    SetLayer("layer_vim_normal")
    Send,^x
    return
  *c::
  *v::return
  *^b::Send,{PgUp}
  *b::^Left
  *n::
  *m::return
  $::End
  *^::Home
  *0::Home
  /::
  ?::
  SC029::Escape ; `

return ; layer_vim_visual

;//////////////////////////////////////////////////////////////
; layer mouse commands
;//////////////////////////////////////////////////////////////
#If current_layer="layer_mouse"
  SC029::Escape ; `
  a::SetLayer("layer_vim_insert")
  i::SetLayer("layer_vim_insert")
  s::Send, {RButton}
  d::Send, {MButton}
  f::
  Send, {LButton Down}
  KeyWait, f ; for drag
  Send, {Lbutton Up}
  return  

  t::Send, {WheelUp}
  g::Send, {WheelDown}

  ^b::Send,{PgUp}
  ^f::Send,{PgDn}
  
  ^l::
    Send , ^l
    SetLayer("layer_vim_insert")
    return
  !l:: !Right
  !h:: !Left
  h:: ; left mouse
  j:: ; down
  k:: ; up
  l:: ; right
  SC027:: ; ';' additional left
    global mouse_move_last
    global mouse_move_distance
    mouse_move_interval := A_TickCount - mouse_move_last
    ;ToolTip, %mouse_move_distance% . %mouse_move_last% . %mouse_move_interval%
    If(mouse_move_interval < 300)   {
      if(mouse_move_distance  < mouse_move_max_distance){
        mouse_move_distance := (mouse_move_max_distance-mouse_move_distance)*mouse_move_accelation_ratio + mouse_move_distance  
      }
    } Else If(mouse_move_interval < 1000)   { ; double click
      mouse_move_distance := mouse_move_distance_double
    } Else { ; first 
      mouse_move_distance := mouse_move_distance_start
    }
    mouse_move_x := GetKeyState("l","P")*mouse_move_distance -(GetKeyState("h","P") |GetKeyState(";","P"))*mouse_move_distance
    mouse_move_y := GetKeyState("j","P")*mouse_move_distance -GetKeyState("k","P")*mouse_move_distance 
    MouseMove, %mouse_move_x%, %mouse_move_y% , 0, R
    mouse_move_last := A_TickCount
  return
  
  tab::SetLayer("layer_number")
  
  m::Send, {WheelUp}
  n::Send, {WheelDown}
return ; layer_mouse

;//////////////////////////////////////////////////////////////
; layer_number commands
;//////////////////////////////////////////////////////////////

#If current_layer="layer_number"
  q:: F1
  w:: F2
  e:: F3
  r:: F4
  t:: F5
  y:: F6
  u:: F7
  i:: F8
  o:: F9
  p:: F10
  [:: F11
  ]:: F12
  
  a::1
  s::2
  d::3
  f::4
  g::5
  h::6
  j::7
  k::8
  l::9
  SC027::0 ; ';' key
  '::=

  z::return
  x::Delete
  +x::BackSpace
  c::
  v::return
  b::
  n::return
  m::-


return ; layer_number
