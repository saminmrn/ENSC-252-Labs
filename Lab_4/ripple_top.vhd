LIBRARY ieee;
USE ieee.std_logic_1164.all;
ENTITY ripple_top is
	PORT(SW : in std_logic_vector(17 downto 0);
			LEDG : out std_logic_vector(8 downto 0);
			LEDR : out std_logic_vector (17 downto 0);
			HEX0 : out std_logic_vector(6 downto 0));
			
end ripple_top; 

Architecture behaviour of ripple_top is 

component ripple_carry is
	PORT(X, Y : in std_logic_vector(3 downto 0);
	Cin: in std_logic;
	S : out std_logic_vector(3 downto 0);
	Cout	: out std_logic); 
end component;

signal sig : std_logic_vector(3 downto 0);

component SegDecoder is 

	Port ( D : in std_logic_vector( 3 downto 0 );
			Y : out std_logic_vector( 6 downto 0 ));
			
end component; 

begin

obj1: ripple_carry
	port map (X => SW(17 downto 14), Y => SW(3 downto 0), Cin => SW(4), Cout => LEDG(0), S => sig);

obj2: segdecoder
	port map (Y => HEX0, D => sig);

LEDR(3 downto 0) <= sig;	

end behaviour;