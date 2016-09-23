import sys
from  saml_schtron.validator import CliInvocation, Validator

def main():
    invocation = CliInvocation()
    validator = Validator(invocation)
    if invocation.args.proflist:
        print('File | Profile')
        for profile in validator.get_profiles():
            print(profile['file'] + ' | ' + profile['name'])
        exit(0)
    else:
        return validator.validate()


if __name__ == '__main__':
    if sys.version_info < (3, 4):
        raise "must use python 3.4 or higher"
    val_result = main()
    print('max. severity: ' + val_result.level)
    print(val_result.json)
