LIBRARY ieee;
USE ieee.numeric_std.all; 
USE ieee.std_logic_1164.all;


Entity TestBCDCount2 is 

port (SW: in std_logic_vector(17 downto 0); 
		KEY: in std_logic_vector(3 downto 0); 
		LEDR: out std_logic_vector(17 downto 0)); 
		
end TestBCDCount2; 

Architecture behaviour of TestBCDCount2 is 

component BCDCount2 is 

port (clear, enable, clk: in std_logic ;
		BCD0: out std_logic_vector(3 downto 0); 
		BCD1: out std_logic_vector(3 downto 0)); 
		
end component; 

begin
obj1: BCDCount2
--keys are active low 
port map(clk=> not KEY(1), clear=> not KEY(0) , enable => SW(0), BCD0=> LEDR(3 downto 0), BCD1=> LEDR(7 downto 4)); 

end behaviour;
