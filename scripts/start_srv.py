#!/usr/bin/env python

import sys
print('\n'.join(sys.path))
import saml_schtron.webapp.config
import saml_schtron.webapp.app_handler
import werkzeug.serving

# start server
def main():
    config = saml_schtron.webapp.config.Config()
    app_handler = saml_schtron.webapp.app_handler.AppHandler(config)
    werkzeug.serving.run_simple(config.HttpServer['listen'],
               config.HttpServer['port'],
               app_handler.application,
               use_debugger=True)


if __name__ == '__main__':
    main()