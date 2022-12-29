LIBRARY ieee;
USE ieee.numeric_std.all; 
USE ieee.std_logic_1164.all;

entity TestDisarm is 
	port (KEY: in std_logic_vector(0 downto 0);
			SW: in std_logic_vector(1 downto 0);
			HEX0, HEX1, HEX2: out std_logic_vector(6 downto 0);
			LEDG : out  std_logic_vector(0 downto 0)); 
end TestDisarm; 

architecture behaviour of TestDisarm is

signal sigClock : std_logic; 

component DisarmSystem is 

	port (clock: in std_logic;
			w  : in std_logic_vector (1 downto 0);
			disarm : out std_logic;
			Seg0, Seg1, Seg2: out std_logic_vector(6 downto 0)); 
end component; 
	
begin

obj1: DisarmSystem
port map(Seg0 => HEX2,
			Seg1=>HEX1 ,
			Seg2 =>HEX0 ,
			disarm=>LEDG(0),
			clock=>KEY(0),
			w=>Sw);
			

end behaviour;