import os

def main():
    file_name="/var/LWASFiles/Sites/testimagepuller/home/site/wwwroot/remove/1.req"
    #file_name="/home/patle/TestImagePuller/remove/1.req"
    
    if not os.path.exists(file_name):
        return 

    file = open(file_name, 'r')
    lines = file.readlines()

    for l in lines:
        print(l)
        os.system("docker image rm {0} -f".format(l.strip()))

    os.remove(file_name)

main()
