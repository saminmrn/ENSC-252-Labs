LIBRARY ieee;
USE ieee.numeric_std.all; 
USE ieee.std_logic_1164.all;

entity top_incr is
	port( SW: in STD_logic_VECtor(17 downto 0);
	KEY: in STD_LOGIC_VECTOR(3 downto 0);
	HEX0, HEX1 : out STD_LOGIC_VECTOR(6 downto 0));
end top_incr;

architecture behaviour of top_incr is

component DispHEx 
	port (D1 :in unsigned(5 downto 0);
			Y0, Y1: out STD_LOGIC_VECTOR( 6 downto 0));

end component; 

component Fcount
	port( D : in Unsigned (3 downto 0);
			clock: in STD_LOGIC;
			Y : out unsigned(5 downto 0 ));
end component;

signal temp: unsigned (5 downto 0);

begin 
 
obj1:  DispHEx 

port map (D1=>temp, Y0=> HEX0, Y1=> HEX1);


obj2:  Fcount

Port map ( D=> unsigned(SW(3 downto 0)), clock => KEY(0), Y => temp ); 


end behaviour;