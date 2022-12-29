LIBRARY ieee;
USE ieee.std_logic_1164.all;
ENTITY FullAdder is
	PORT(A, B, C: in std_logic;
			Carry, Sum : out std_logic); 
			
end FullAdder; 

Architecture behaviour of FullAdder is 
	begin 
	sum <= A XOR B XOR C ;
	carry<= (C AND (A XOR B)) OR (A AND B);
	end behaviour; 