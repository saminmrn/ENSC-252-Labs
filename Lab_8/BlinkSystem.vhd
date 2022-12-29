LIBRARY ieee;
USE ieee.numeric_std.all; 
USE ieee.std_logic_1164.all;

entity BlinkSystem is 
	port (clock, enable: in std_logic;
			Seg0, Seg1, Seg2, Seg3: out std_logic_vector(6 downto 0);
			green: out std_logic_vector(7 downto 0);
			red : out std_logic_vector(17 downto 0)); 
end BlinkSystem; 

Architecture behaviour of BlinkSystem is 

signal sigClock : std_logic:= '0'; 
component PreScale is 
generic (dw : integer := 25);
	port (inCLOCK: in std_logic;
			outCLOCK: out std_logic); 
end component; 


Begin 
process (sigClock, enable)

	BEGIN
	if (enable= '1') THEN
		if (sigClock='1') THEN
		
				seg0<="0001001" ; 
				seg1<="0000110" ;
				seg2<="1000111" ; 
				seg3<="0001100" ; 
				red<= (others=> '1');
				green <= (others=> '1');
				
			else 
				--everything off
				seg0<="1111111" ; 
				seg1<="1111111" ;
				seg2<="1111111" ; 
				seg3<="1111111" ;  
			
			   red<= (others=> '0');
				green <= (others=> '0');
			
			end if;
		else 
			--everything off
				seg0<="1111111" ; 
				seg1<="1111111" ;
				seg2<="1111111" ; 
				seg3<="1111111" ;  
			
			   red<= (others=> '0');
				green <= (others=> '0');
				
	end if;
	END PROCESS; 

obj1: PreScale
port map ( inCLOCK =>  clock, outCLOCK => sigClock);



end behaviour; 