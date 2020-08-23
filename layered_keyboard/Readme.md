#Layered keybaord
 Implement some feature of [qmk](https://docs.qmk.fm/#/features) using [AutoHotKey](https://www.autohotkey.com/)
 - 4 layer
 - mouse key

#Usage
 - short click layer key(LCtrl,RShift)
  - Left Control : layer_normal
  ![layer_normal_](https://github.com/sj0000e/AutoHotKey/blob/master/layered_keyboard/layer_normal.png) 
  - Right Shift : layer_vim_normal(hjkl arrow) - Special layer
  ![layer_vim_normal](https://github.com/sj0000e/AutoHotKey/blob/master/layered_keyboard/layer_vim_normal.png) 
  - Left Shift : layer_mouse(hjkl arrow) +;(left)
  ![layer_mouse](https://github.com/sj0000e/AutoHotKey/blob/master/layered_keyboard/layer_mouse.png) 
  - Left Number : layer_number
  ![layer_number](https://github.com/sj0000e/AutoHotKey/blob/master/layered_keyboard/layer_number.png) 
  

@startuml
[*]->layer_normal
layer_normal --> layer_vim_normal : Rshift
layer_normal : Always LCtrl(Short)
layer_vim_normal --> layer_normal : LCtrl
layer_vim_normal : Special layer
layer_vim_normal : Always Rshift(Short)

layer_vim_normal --> layer_mouse : LShift
layer_mouse : Special layer
layer_vim_normal --> layer_number : Tab
layer_number : Special layer
layer_mouse --> layer_number : Tab
@enduml