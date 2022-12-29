LIBRARY ieee;
USE ieee.std_logic_1164.all;
ENTITY ripple_carry is
	PORT(X, Y : in std_logic_vector(3 downto 0);
	Cin : in std_logic;
			S : out std_logic_vector(3 downto 0);
			Cout	: out std_logic); 
			
end ripple_carry; 

Architecture behaviour of ripple_carry is 

component FullAdder is
	PORT(A, B, C: in std_logic;
			Carry, Sum : out std_logic); 
end component; 

signal C1, C2, C3 : std_logic;

begin

FullAdder1 : FullAdder
	port map (A => X(0), B => Y(0), C => Cin, Sum => S(0), Carry => C1 );
	
FullAdder2 : FullAdder
	port map (A => X(1), B => Y(1), C => C1, Sum => S(1), Carry => C2 );
	
FullAdder3 : FullAdder
	port map (A => X(2), B => Y(2), C => C2, Sum => S(2), Carry => C3 );

FullAdder4 : FullAdder
	port map (A => X(3), B => Y(3), C => C3, Sum => S(3), Carry => Cout );
	
End Behaviour;
		
	