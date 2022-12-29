LIBRARY ieee;
USE ieee.numeric_std.all; 
USE ieee.std_logic_1164.all;

ENTITY Fcount_tb2_tb is 
end Fcount_tb2_tb;

ARCHITECTURE Behaviour of Fcount_tb2_tb is

COMPONENT Fcount_tb2 IS --the component we would like to test
	port( D : in Unsigned (3 downto 0);
			clock: in STD_LOGIC;
			Y : out unsigned(5 downto 0 ));
	END COMPONENT;

	--for clock generation
	constant clk_hz : integer := 50e6; --f = 50 Mhz clock
	constant clk_period : time := 1 sec / clk_hz; --1/f = T = 20 ns period

	--DUT signals required
	SIGNAL tb_d : UNSIGNED(3 downto 0);
	SIGNAL tb_y : UNSIGNED(5 downto 0);
	SIGNAL tb_clock : std_logic := '1'; --DUT's clock input. Assign the clock a starting value for Modelsim
	
	BEGIN
	
		DUT : Fcount_tb2
		PORT MAP(clock => tb_clock, d => tb_d, y => tb_y);

		--Simple assignment statement that inverts the clock ever clk_period/2 to create 
		--a constant clock signal for our simulations
		tb_clock <= NOT tb_clock after clk_period / 2; 
		
stimulus : process
BEGIN
tb_d<= "0000";
wait for 23 ns;
tb_d<= "0001";
wait for 23 ns; 
tb_d<= "0010";
wait for 23 ns; 
tb_d<= "0011";
wait for 23 ns; 
tb_d<= "0100";
wait for 23 ns;
tb_d<= "0101";
wait for 23 ns; 
tb_d<= "0110";
wait for 23 ns; 
tb_d<= "0111";
wait for 23 ns;
tb_d<= "1000";
wait for 23 ns;
tb_d<= "1001";
wait for 23 ns; 
tb_d<= "1010";
wait for 23 ns; 
tb_d<= "1011";
wait for 23 ns;
tb_d<= "1100";
wait for 23 ns;
tb_d<= "1101";
wait for 23 ns; 
tb_d<= "1110";
wait for 23 ns; 
tb_d<= "1111";
wait for 23 ns;

wait for 100 ns;
		
		assert false;
		report "simulation ended" severity failure; --brute force quit so simulation does not run forever
	END process;

END Behaviour;
