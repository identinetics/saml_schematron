from datetime import datetime
from lxml import etree
import pathlib
import sys


""" return remaining days for validUntil in root element for a SAML metadata file passed as argument """
def main():
    md_file = get_file()
    tdelta = get_remaining_days(md_file)
    print(tdelta.days)


def get_file() -> pathlib.Path:
    assert len(sys.argv) == 2, 'need 1 argument with metadata aggregate file path'
    md_file = pathlib.Path(sys.argv[1])
    assert md_file.is_file, sys.argv[1] + ' must be a valid file'
    return md_file


def get_remaining_days(md_file) -> int:
    t = etree.parse(md_file.open(mode='rb'))
    validuntil_str = t.getroot().attrib['validUntil']
    validuntil = datetime.strptime(validuntil_str, '%Y-%m-%dT%H:%M:%SZ')
    return validuntil - datetime.now()


if __name__ == '__main__':
    if sys.version_info < (3, 4):
        raise "must use python 3.4 or higher"
    main()

