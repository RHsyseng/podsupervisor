import json
import pprint

pp = pprint.PrettyPrinter(indent=4)
file_name = 'data/endpoints/endpoints.json'

"""Structure we are looking for

            "subsets": [
                {
                    "addresses": [
                        {
                            "ip": "192.168.1.201",
                            "targetRef": {
                                "kind": "Node",
                                "name": "control-plane-0",
                                "uid": "83374eeb-947c-4dee-a9b5-65b74cec81a8"
                            }
                        },
"""

with open(file_name, 'r', encoding='utf-8') as f:
      my_list = json.load(f)
      
      for obj in my_list['items']:
          print('\n')
          if 'subsets' in obj:
             print('Has Subsets\n')
             subsets = obj['subsets']
             ssize = len(subsets)
             print(ssize)
             addresses = subsets[0]
             asize = len(addresses)
             print(asize)
             #for index in range(1,asize):
             #   address = addresses[index]
             for address in addresses:
                print(address)
                print('\n')
                if 'targetRef' in address:
                    print(address)
                    quit()
              
