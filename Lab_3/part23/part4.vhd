library ieee;
use ieee.std_logic_1164.all; 

entity part4 is 

	Port ( SW : in std_logic_vector( 17 downto 0 );
			HEX0, HEX1 : out std_logic_vector( 6 downto 0 );
			KEY: in std_logic_vector(0 downto 0));
			
end part4; 

architecture part4f of part4 is
 
component  SegDecoder is 

	Port ( D : in std_logic_vector( 3 downto 0 );
			Y : out std_logic_vector( 6 downto 0 ));
			
end component; 

	
signal a, b, c, d : std_logic_vector(6 downto 0);

	

		
begin 


SegDecoder1 : SegDecoder
	 port map (d => sw (13 downto 10) , Y => a);
	 
SegDecoder2 : SegDecoder
	 port map (d => sw (3 downto 0) , Y => b);
	 
SegDecoder3 : SegDecoder
	  port map (d => sw (17 downto 14) , Y => c);
	  
SegDecoder4 : SegDecoder
	  port map (d => sw (7 downto 4) , Y => d9);
	  
	  

HEX0 <= b when (KEY(0) = '1') else a;
HEX1 <= d when (KEY(0) = '1') else c;

end part4f; 