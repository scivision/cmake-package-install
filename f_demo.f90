module f_demo

implicit none

contains

pure integer function addone(x)

integer, intent(in) :: x
addone = x + 1

end function addone

end module f_demo
