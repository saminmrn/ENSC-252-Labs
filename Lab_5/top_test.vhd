LIBRARY ieee;
USE ieee.numeric_std.all; 
USE ieee.std_logic_1164.all;

ENTITY top_test is 
	port( SW : in STD_LOGIC_vector(17 downto 0);
			HEX0, HEX1: out STD_LOGIC_vector(6 downto 0));
end top_test;


Architecture behaviour of top_test is 
 
 component DispHEX
	port (D1 :in unsigned(5 downto 0);
			Y0, Y1: out STD_LOGIC_VECTOR( 6 downto 0));
			
	end component; 
			
begin

obj1: DispHEX 
Port map (D1=> unsigned (SW (5 downto 0 ) ), Y0 => HEX0,  Y1 => HEX1);
			
			
			
end behaviour;
