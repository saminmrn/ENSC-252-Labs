LIBRARY ieee;
USE ieee.numeric_std.all; 
USE ieee.std_logic_1164.all;

Entity TestReaction is 

port ( 
		KEY: in std_logic_vector(3 downto 0);
		SW: in std_logic_vector(17 downto 0); 
		HEX0,HEX1:out std_logic_vector(6 downto 0); 
		ClOCK_50: in std_logic; 
		LEDR: out std_logic_vector(17 downto 0));
		
end TestReaction; 

architecture behaviour of TestReaction is 

component SegDecoder is 

	Port ( D : in std_logic_vector( 3 downto 0 );
			Y : out std_logic_vector( 6 downto 0 ));
			
end component; 

component BCDCount2 is 

port (clear, enable, clk: in std_logic ;
		BCD0: out std_logic_vector(3 downto 0); 
		BCD1: out std_logic_vector(3 downto 0)); 
		
end component; 


component PreScale is 
	port (CLKin: in std_logic;
			CLKout: out std_logic); 
end component; 

signal and_sig, mux_sig, enable_sig, clk_sig, q_out, w, reset : std_logic;
signal bcd_sig0, bcd_sig1 : std_logic_vector (3 downto 0);
signal hex_sig0, hex_sig1 : std_logic_vector(6 downto 0);

--Flip-flop behaviour

begin
process (clk_sig)
	BEGIN
		if (rising_edge(Clk_sig)) THEN
			q_out <= and_sig;
		else
			q_out <= q_out;
		end if;	
		
end process;

LEDR(17) <= not q_out;

--Mux behaviour
mux_sig <= '1' when (w = '1')
	else q_out;
	
-- and gate behaviour
and_sig <= mux_sig and not KEY(2);


obj1: BCDCount2
port map (clear=>reset, enable => q_out, BCD0 => BCD_sig0, BCD1 => BCD_Sig1, clk => clk_sig);

obj2: PreScale
port map (CLKin => CLOCK_50, CLKout => clk_sig);

obj3: SegDecoder
port map (D => BCD_sig0, Y => HEX0);

obj4: SegDecoder
port map (D=> BCD_sig1, Y => HEX1);

w <= SW(0);
reset <= SW(1);



end behaviour;