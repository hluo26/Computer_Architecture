LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_signed.all;

ENTITY n_bit_up_down_counter IS
	GENERIC (n_bits : NATURAL := 8);
	PORT (up_down	: IN	STD_LOGIC; -- direction of count, 1 --> counting up, 0 --> counting down
	      clk, rst	: IN	STD_LOGIC;
	      count	    : OUT	STD_LOGIC_VECTOR(n_bits-1 downto 0)
			);
END n_bit_up_down_counter;

ARCHITECTURE behavioral OF n_bit_up_down_counter IS
   
   -- Architecture declarations
  
   -- Internal signal declarations
    SIGNAL count1 : STD_LOGIC_VECTOR(n_bits-1 downto 0);
   
   
BEGIN

   -- insert your design here --
    
   -----------------------------
     PROCESS (clk, rst)
     BEGIN
             if (rst = '1') then
                 count1 <= (OTHERS=>'0');
             elsif (clk'EVENT AND clk = '1') then
                if (up_down = '0') then
                     count1 <= count1 - 1;
                 else
                     count1 <= count1 + 1;
                 end if;
             end if;
         end process;
         count <= count1;
END behavioral;

