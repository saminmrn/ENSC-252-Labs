LIBRARY ieee;
USE ieee.numeric_std.all; 
USE ieee.std_logic_1164.all;

entity DisarmSystem is 

	port (clock: in std_logic;
			w  : in std_logic_vector (1 downto 0);
			disarm : out std_logic;
			Seg0, Seg1, Seg2: out std_logic_vector(6 downto 0)); 
end DisarmSystem; 

architecture behaviour of DisarmSystem is
Type state_type is (A,B, C,D);
signal next_state, current_state : state_type;

	begin
	process (current_state, W)
		begin
			CASE current_state is
			when A=>
				seg0<="1111111" ; 
				seg1<="1111111"  ;
				seg2<="1111111" ;
				
			 if (W = "11") then
			 	next_state <= B;

			 else
				next_state <= A;
		 
			end if;
			
			when B=>
		
				seg0<="0110000" ; 
				seg1<="1111111"  ;
				seg2<="1111111" ; 
				
			 if (W = "01") then
				next_state <= C;
				
			 else
				next_state <= A;

				
			end if;
			
			when C=>		
			   seg0<="0110000" ; 
				seg1<="1111001" ;
				seg2<="1111111" ;
			 if (W = "10") then
				next_state <= D;

			 else
				next_state <= A;
 
			end if;
			 
			when D=>
				seg0<="0110000" ; 
				seg1<="1111001" ;
				seg2<="0100100" ; 
				next_state <= A;

		END CASE;
		
end process;
process (clock)
	begin
	if(rising_edge(clock)) then 
	current_state <= next_state;
	end if;
	
end process;

disarm <= '1' when current_state = D else '0';



end behaviour;