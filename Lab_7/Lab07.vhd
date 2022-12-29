LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY Lab07 is
	PORT (
		SW : in std_logic_vector(17 downto 0);
		LEDR : out std_logic_vector(17 downto 0) := (others => '0');
		LEDG : out std_logic_vector(8 downto 0 ) := (others => '0');
		KEY : in std_logic_vector(3 downto 0);
		CLOCK_50 : in std_logic;

		I2C_SDAT : inout std_logic;
		I2C_SCLK, AUD_XCK : out std_logic;
		AUD_ADCDAT : in std_logic;
		AUD_DACDAT : out std_logic;
		AUD_ADCLRCK, AUD_DACLRCK, AUD_BCLK : in std_logic );
END Lab07;


ARCHITECTURE Structural of Lab07 is

	SIGNAL	AudioIn, AudioOut : signed(15 downto 0);
	SIGNAL	SamClk : std_logic;
	signal x,y : std_logic;
--	Signal OpX,OpY, Sum : signed(3 downto 0);
	
	COMPONENT AudioInterface is
	Generic ( SID : integer := 100); 
	Port (CLOCK_50 : in std_logic;
		init : in std_logic;

		I2C_SDAT : inout std_logic;
		I2C_SCLK, AudMclk : out std_logic;
		AUD_ADCDAT : in std_logic;
		AUD_DACDAT : out std_logic;
		AUD_ADCLRCK, AUD_DACLRCK, AUD_BCLK : in std_logic;
		
		SamClk : out std_logic;
		AudioIn : out signed(15 downto 0);
		AudioOut : in signed(15 downto 0));
	END COMPONENT;
	
	Component ToneGenerator is
	port (clear, clock : in std_logic;
			Freq: in unsigned(15 downto 0); 
			WaveOut: out signed (15 downto 0)); 

	End component;
	
	Component MorseGenerator is
	port (clock : in std_logic;
			PulseOut: out std_logic);
			-- Q: out std_logic_vector(5 downto 0)); 

	End Component;


BEGIN


--***********************************************************************************
-- You must enter the last five digits from the student number of one group member.
-- Ex: AudioInterface generic map ( SID => xxxxx ) - where xxxxx are the last 5 digits.
--
--***********************************************************************************
			assm: AudioInterface	generic map ( SID => 62792 )
			PORT MAP( Clock_50 => CLOCK_50, AudMclk => AUD_XCK,	-- period is 80 ns ( 12.5 Mhz )
						init => KEY(0), 									-- +ve edge initiates I2C data
						I2C_Sclk => I2C_SCLK,
						I2C_Sdat => I2C_SDAT,
						AUD_BCLK => AUD_BCLK, AUD_ADCLRCK => AUD_ADCLRCK, AUD_DACLRCK => AUD_DACLRCK,
						AUD_ADCDAT => AUD_ADCDAT, AUD_DACDAT => AUD_DACDAT,
						AudioOut => AudioOut, AudioIn => AudioIn, SamClk => SamClk );
						
			obj1: ToneGenerator
			Port map(WaveOut => AudioOut,
							clear=>y,
							clock=> SamClk,
					 		Freq=>unsigned(SW(15 downto 0)));
			
			obj2: MorseGenerator
			port map( PulseOut=> x, clock=> SamClk); -- Q=>LEDR(5 downto 0)); 
			
			LEDG(0) <= x;
			y<=x or (not(KEY(1))); 
						
	

				--AudioOut <= AudioIn;
			--	OpX <= signed(SW(3 downto 0));
			--	OpY <= signed(SW(7 downto 4));
				
				
			--	Sum <= OpX+OpY; 
			--	(LEDR(3 downto 0))<= std_logic_vector(Sum) ;
	
	
END Structural;
