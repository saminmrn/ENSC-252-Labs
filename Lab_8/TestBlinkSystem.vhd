LIBRARY ieee;
USE ieee.numeric_std.all; 
USE ieee.std_logic_1164.all;

entity TestBlinkSystem is 
	port (CLOCK_50: in std_logic;
			SW: in std_logic_vector(3 downto 0);
			HEX4, HEX5, HEX6, HEX7: out std_logic_vector(6 downto 0);
			LEDR : out std_logic_vector(17 downto 0);
			LEDG : out  std_logic_vector(7 downto 0)); 
end TestBlinkSystem; 

architecture behaviour of TestBlinkSystem is

signal sigClock : std_logic; 

	Component BlinkSystem is 
		port (clock, enable: in std_logic;
				Seg0, Seg1, Seg2, Seg3: out std_logic_vector(6 downto 0);
				green: out std_logic_vector(7 downto 0);
				red : out std_logic_vector(17 downto 0)); 
	end component; 
	
begin

obj1: BlinkSystem
port map(enable =>SW(0), 
			Seg0 => HEX7,
			Seg1=>HEX6 ,
			Seg2 =>HEX5 ,
			Seg3=>HEX4,
			green=>LEDG,
			red =>LEDR,
			clock=>CLOCK_50);
			

end behaviour;