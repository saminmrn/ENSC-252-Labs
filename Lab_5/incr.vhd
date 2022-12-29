LIBRARY ieee;
USE ieee.numeric_std.all; 
USE ieee.std_logic_1164.all;

ENTITY incr is 
	port(clock : in STD_LOGIC;
			f : out unsigned(5 downto 0));
end incr;

ARCHITECTURE behaviour of incr is 
signal temp : unsigned (5 downto 0) := "000000";--initializing the signal to 0
BEGIN
	process(clock)
	BEGIN
		if (clock='1' and clock'event) THEN
			temp <= temp+1;

		end if;
	END PROCESS;
f <= temp;
END behaviour;

