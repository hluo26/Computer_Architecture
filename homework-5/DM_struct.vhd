LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;


ENTITY DataMem IS
   PORT( 
      Address : IN     std_logic_vector (31 DOWNTO 0);
      MemWrite   : IN     std_logic;
      WriteData  : IN     std_logic_vector (31 DOWNTO 0);
      clk        : IN     std_logic;
      rst        : IN     std_logic;
      ReadData : OUT    std_logic_vector (31 DOWNTO 0)
   );
END DataMem ;


ARCHITECTURE struct OF DataMem IS

   -- Architecture declarations
   type data_mem_type is array(0 to 255) of std_logic_vector(31 downto 0);
      
   constant zero_register : std_logic_vector(31 downto 0) := (others => '0');
   constant initial_mem : data_mem_type := (others => zero_register);

   -- Internal signal declarations
   SIGNAL data_mem : data_mem_type;

BEGIN

   -- insert your design here --
process1 : process(clk,rst)
        begin
        if(rst = '1')then
            data_mem <= initial_mem;
        elsif(clk' event and clk = '1')then
            if (MemWrite = '1')then
                data_mem(CONV_INTEGER(Address)) <= WriteData;
            end if;
        end if;
        end process process1;    
   -----------------------------
        ReadData <= data_mem(CONV_INTEGER(Address));
    
END struct;
