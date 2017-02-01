LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;


ENTITY PC_register IS
   PORT( 
      PC_next : IN     std_logic_vector (31 DOWNTO 0);
      clk     : IN     std_logic;
      rst     : IN     std_logic;
      PC      : OUT    std_logic_vector (31 DOWNTO 0)
   );
END PC_register ;


ARCHITECTURE struct OF PC_register IS

	constant text_segment_start : std_logic_vector(31 downto 0) := x"00400000";

BEGIN

process1 : process(clk,rst)
  begin
        if(rst = '1')then
            PC <=x"00400000";
        elsif(clk' event and clk = '1')then
            PC <= PC_next;
        end if;
end process process1;

END struct;
