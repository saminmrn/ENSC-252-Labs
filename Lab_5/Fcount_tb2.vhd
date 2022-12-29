LIBRARY ieee;
USE ieee.numeric_std.all; 
USE ieee.std_logic_1164.all;

ENTITY Fcount_tb2 is -- part 5
	port( D : in Unsigned (3 downto 0);
			clock: in STD_LOGIC;
			Y : out unsigned(5 downto 0 );
			rst : in STD_LOGIC);
end Fcount_tb2;


Architecture structure of  Fcount_tb2 is 

signal temp : unsigned (5 downto 0) := "000000";--initializing the signal to 0
BEGIN
	process(clock,rst)
	BEGIN
		if (rst='0') then 
		temp <=(others =>  '0') ; 
		elsif (rising_edge(clock)) then 
		temp <=  temp + D ; 

		end if;
	END PROCESS;
Y	<= temp;

end structure;

