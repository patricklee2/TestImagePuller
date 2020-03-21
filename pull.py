import os

def main():
    file_name="/var/LWASFiles/Sites/testimagepuller/home/site/wwwroot/pullandtag/1.req"
    #file_name="/home/patle/TestImagePuller/pullandtag/1.req"
    
    if not os.path.exists(file_name):
        return 

    file = open(file_name, 'r')
    lines = file.readlines()

    for l in lines:
        print(l)
        src = l.strip().split(',')[0].strip()
        tag = l.strip().split(',')[1].strip()

        os.system("docker pull {0}".format(src))
        os.system("docker tag {0} {1}".format(src, tag))


    os.remove(file_name)

main()
