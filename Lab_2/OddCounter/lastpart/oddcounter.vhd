LIBRARY ieee ;
USE ieee.std_logic_1164.all ;



ENTITY OddCounter IS
PORT ( x1, x2,x3,x4 : IN STD_LOGIC ;
f : OUT STD_LOGIC ) ;
END OddCounter ;



ARCHITECTURE LogicFunction OF OddCounter IS

component light -- light component declaration
	
	port(
	x1 : in std_logic;
	x2 : in std_logic;
	f : out std_logic);
end component;
	
	
	signal a : std_logic;
	signal b : std_logic;
	

BEGIN 

light1 : light 
port map (
x1 => x1,
x2 => x2,
f => a);


light2: light
port map (
x1 => x3,
x2 => x4,
f => b);

light3: light
port map (
x1 => a,
x2 => b,
f => f);

END LogicFunction ;
