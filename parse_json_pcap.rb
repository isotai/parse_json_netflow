#for NetFlow v9 
require 'json'

@hash = {}
fileName = "./xflow-dump.json"

File.open(fileName) do |file|
  @hash = JSON.load(file)
end

hashSize = @hash.size

hashSize.times do |i|

  @flowSetHash = @hash[i].dig("_source","layers","cflow").select{|key,value| key.include?("FlowSet")} #flowsets
  flowSetHash_key = @flowSetHash.keys # keys for fetching flowsets
   
  flowSetHash_key.each do |fsKey|
    flowId = @flowSetHash.dig(fsKey,"cflow.flowset_id")
    
    if flowId != "0" && @flowId != "1"  then # remove template 
      @flowSets = @flowSetHash.dig(fsKey).select{|key,value| key.match(/Flow.[1-50]/)} #about 30 maximam
      flowSetNum = @flowSets.size 
      flowSetNum.times do |j|
        j += 1 
         # do what you need to do here
         #like p @flowSets.dig("Flow #{j}","cflow.octets")
      end
    end
  end
end
            #  cflow": {
          # "cflow.version": "9",
          # "cflow.count": "5",
          # "cflow.sysuptime": "2817188.944000000",
          # "cflow.timestamp": "Jul 12, 2018 17:23:46.000000000 \u00e6\u009d\u00b1\u00e4\u00ba\u00ac (\u00e6\u00a8\u0099\u00e6\u00ba\u0096\u00e6\u0099\u0082)",
          # "cflow.timestamp_tree": {
          #   "cflow.unix_secs": "1531383826"
          # },
          # "cflow.sequence": "8705961",
          # "cflow.source_id": "0",
          # "FlowSet 1 [id=256] (5 flows)": {
          #   "cflow.flowset_id": "256",
          #   "cflow.flowset_length": "269",
          #   "cflow.template_frame": "226",
          #   "Flow 1": {
          #     "cflow.srcaddr": "",
          #     "cflow.dstaddr": "",
          #     "cflow.sampler_id": "0",
          #     "cflow.inputint": "21",
          #     "cflow.outputint": "0",
          #     "cflow.srcport": "5060",
          #     "cflow.dstport": "5060",
          #     "cflow.tos": "0x00000000",
          #     "cflow.protocol": "17",
          #     "cflow.srcmask": "24",
          #     "cflow.dstmask": "0",
          #     "cflow.tcpflags": "0x00000000",
          #     "cflow.tcpflags_tree": {
          #       "cflow.tcpflags.reserved": "0x00000000",
          #       "cflow.tcpflags.urg": "0",
          #       "cflow.tcpflags.ack": "0",
          #       "cflow.tcpflags.psh": "0",
          #       "cflow.tcpflags.rst": "0",
          #       "cflow.tcpflags.syn": "0",
          #       "cflow.tcpflags.fin": "0"
          #     },
          #     "cflow.srcas": "0",
          #     "cflow.dstas": "0",
          #     "cflow.nexthop": "0.0.0.0",
          #     "cflow.octets": "2838",
          #     "cflow.packets": "6",
          #     "cflow.timedelta": "4.660000000",
          #     "cflow.timedelta_tree": {
          #       "cflow.timestart": "2817167.972000000",
          #       "cflow.timeend": "2817172.632000000"
          #     }
          #   },
