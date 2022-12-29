Library ieee;
Use ieee.std_logic_1164.all;
Use ieee.numeric_std.all;

Entity MorseGenerator is
	port (clock : in std_logic;
			PulseOut: out std_logic);
			--Q: out std_logic_vector(5 downto 0)); 

End MorseGenerator;

Architecture behaviour of MorseGenerator is

signal SlowClock : signed (13 downto 0):= (others=> '0'); 
signal sigOut : unsigned (5 downto 0)= (others=> '0');
signal newclock: std_logic;
 

Begin 
process (clock)

	BEGIN
		if (rising_edge(clock)) THEN
			SlowClock <= SlowClock +1;

		end if;
	END PROCESS;
-- Pulseout <= SlowClock(13);
newClock <= SlowClock(13);
process (newClock)

	Begin
	if (rising_edge(newClock)) THEN
	if sigout="000000" THEN
		sigout<="100001"; --33
	else
		sigOut <= sigOut -1;
	end if;
  end if;
 end process;
-- Q<=std_logic_vector(sigout);

with sigout select 
pulseOut <= '1' when "100001", -- 33
				'1' when "011111", -- 31
				'1' when "011101", -- 29
				'1' when "011001", -- 25
				'1' when "011000", -- 24
				'1' when "010111", -- 23
				'1' when "010101", -- 21
				'1' when "010100", -- 20
				'1' when "010011", -- 19
				'1' when "010001", -- 17
				'1' when "010000", -- 16
				'1' when "001111", -- 15
				'1' when "001011", -- 11
				'1' when "001001", -- 9
				'1' when "000111", -- 7
				'0' when others;

end behaviour;