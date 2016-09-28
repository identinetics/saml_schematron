import json
import os
from saml_schtron.validator import ApiArgs, Validator

__author__ = 'r2h2'


def gen_profile_rules(profile):
    with open('rules/profiles/' + profile['file']) as fd:
        profile_dict = json.loads(''.join(fd.readlines()))
    html = '<html><head><meta charset="UTF-8"><link rel="stylesheet" type="text/css" ' \
           'href="../css/tables.css"></head><body><h1>SAML Schematron Rules for profile "%s"</h1>%s</body></html>'
    os.system('scripts/listrules.sh > work/listrules.json')
    rules = json.loads(''.join(open('work/listrules.json').readlines()))
    tabhtml = '<table class="pure-table">'
    for rule in sorted(rules):
        if not rule.startswith('rule'):
            continue
        if rule not in profile_dict['rules']:
            continue
        try:
            tabhtml += '<tr><td>%s</td><td>%s</td><td>%s</td></tr>\n' % \
                    (rule, rules[rule]["Severity"], rules[rule]["Message"])
        except KeyError as e:
            print("rule:" + rule)
            raise
    tabhtml += '</table>'
    fname = 'saml_schtron/webapp/static/html/' + profile['file'][:-5] + '.html'
    with open(fname, 'w') as fd:
        fd.write(html % (profile['name'], tabhtml))
    print('File %s written.' % fname)


validator = Validator(ApiArgs(listprofiles=True).cliInvocation)
gen_profile_rules({'file': 'allrules.json', 'name': 'All available schematron rules'})
for profile in validator.get_profiles():
    gen_profile_rules(profile)