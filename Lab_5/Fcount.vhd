LIBRARY ieee;
USE ieee.numeric_std.all; 
USE ieee.std_logic_1164.all;

ENTITY Fcount is 
	port( D : in Unsigned (3 downto 0);
			clock: in STD_LOGIC;
			Y : out unsigned(5 downto 0 ));
end Fcount;


Architecture structure of  Fcount is 

signal temp : unsigned (5 downto 0) := "000000";--initializing the signal to 0
BEGIN
	process(clock)
	BEGIN
		if (clock='1' and clock'event) THEN
			temp <= temp + D ;

		end if;
	END PROCESS;
Y	<= temp;


end structure;

