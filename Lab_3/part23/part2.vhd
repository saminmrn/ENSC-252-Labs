library ieee;
use ieee.std_logic_1164.all; 

entity part2 is 

	Port ( SW : in std_logic_vector( 17 downto 0 );
			LEDR : out std_logic_vector( 17 downto 0 ) );
			
end part2; 

architecture part2f of part2 is 
begin 
	LEDR <= SW;
end part2f; 
