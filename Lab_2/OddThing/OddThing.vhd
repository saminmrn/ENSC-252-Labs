LIBRARY ieee ;
USE ieee.std_logic_1164.all ;
ENTITY OddThing IS
PORT ( x1, x2, x3, x4 : IN STD_LOGIC ;
f : OUT STD_LOGIC) ;
END OddThing;
ARCHITECTURE LogicFunction OF OddThing IS
BEGIN
f <= (x1 XOR x2) XOR (x3 XOR x4);
END LogicFunction;
