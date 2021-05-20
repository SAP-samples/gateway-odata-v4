# OData V4 code based implementation
[![REUSE status](https://api.reuse.software/badge/github.com/SAP-samples/gateway-odata-v4)](https://api.reuse.software/info/github.com/SAP-samples/gateway-odata-v4)
## Description
*gateway-odata-v4* is a collection of sample code to show how OData V4 based services can be build using the SAP Gateway OData V4 framework.  

You find more information about this implementation in the following blog posts:
- [OData V4 code based implementation – Overview](https://blogs.sap.com/2017/12/12/odata-v4-code-based-implementation-overview/)
- [OData V4 code based implementation I (basic interface, read access)](https://blogs.sap.com/2017/12/12/odata-v4-code-based-implementation-i-basic-interface-read-access/)
- [OData V4 code based implementation II (basic interface, create & update)](https://blogs.sap.com/2017/12/20/odata-v4-code-based-implementation-i-basic-interface-create-update/)

> **Caution:**  
> Please note that in the latest release of SAP S/4HANA 2020 FSP1 you can build OData V4 services using the **ABAP RESTful Programming Model** which is the **recommended development approach in SAP S/4HANA**.  
> As discussed in the blog post [OData service development options](https://blogs.sap.com/2017/12/12/odata-service-development-options/) the implementation of an OData V4 service using code based implementation leveraging the SAP Gateway OData V4 framework is a valid approach if your need for an OData V4 service cannot wait but you are on a release prior to SAP S/4HANA 2020 FSP1.

## Requirements

This code is intended to run on:  

- SAP NetWeaver 7.52 SP05 or higher 
- SAP S/4HANA Foundation 1809 SP03 or later.

Though a first implementation of the OData V4 SAP Gateway framework is available as of SAP NetWeaver 750 SP04 this SAP NetWeaver ABAP stack and also the SAP NetWeaver 751 do not receive any downports. If you nevertheless try to install this package on SAP NetWeaver 750 or 751 you may find that certain features are not yet supported.  

For an overview of the SAP Gateway Foundation Support Package Stack Definition see [SAP Note 2512479](https://launchpad.support.sap.com/#/notes/2512479).  

## Download and Installation

You can download this code and import it into an on premises system using ABAPGIT.

## Known Issues

There are no known issues.

## How to obtain support

[Create an issue](https://github.com/SAP-samples/<repository-name>/issues) in this repository if you find a bug or have questions about the content.
 
For additional support, [ask a question in SAP Community](https://answers.sap.com/questions/ask.html).

## Contributing

## License
Copyright (c) 2021 SAP SE or an SAP affiliate company. All rights reserved. This project is licensed under the Apache Software License, version 2.0 except as noted otherwise in the [LICENSE](LICENSES/Apache-2.0.txt) file.
