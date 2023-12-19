## Sqids & RAD Server for Delphi

[![Sqids Screen Shot][product-screenshot]][sqids-url]

[Sqids](https://sqids.org/) (_pronounced "squids"_) is a small library that lets you **generate unique IDs from numbers**. It's good for link shortening, fast & URL-safe ID generation and decoding back into numbers for quicker database lookups.

Features:

- **Encode multiple numbers** - generate short IDs from one or several non-negative numbers
- **Quick decoding** - easily decode IDs back into numbers
- **Unique IDs** - generate unique IDs by shuffling the alphabet once
- **ID padding** - provide minimum length to make IDs more uniform
- **URL safe** - auto-generated IDs do not contain common profanity
- **Randomized output** - Sequential input provides nonconsecutive IDs
- **Many implementations** - Support for [40+ programming languages](https://sqids.org/)

## Use-cases

✅ Good for:

- Generating IDs for public URLs (eg: link shortening)
- Generating IDs for internal systems (eg: event tracking)
- Decoding for quicker database lookups (eg: by primary keys)

❌ Not good for:

- Sensitive data (this is not an encryption library)
- User IDs (can be decoded revealing user count)

## About this repository

This respository contains a ProjectGroup with two Delphi projects. One is the RAD Server instance and a VCL client that connects to it. Becuase this demo connects to a database, you will need to define in the FDConnection the InterBase _employee.gdb_ database.

## Sqids Code examples with RAD Server

RAD Server integrates Sqids since RAD Studio 12 Athens. To encode and decode your IDs you only need to define in the _TRESTRequest.Resource_ the symbol **#** before the ID.

#### Using the TEMSDatasetResource attributes

```pascal
[ResourceName('Customers')]
TCustomersResource = class(TDataModule)
  qryCustomers: TFDQuery;
  [ResourceSuffix('list', '/')]
  [ResourceSuffix('get', '/{#CUST_NO}')]
  [ResourceSuffix('put', '/{#CUST_NO}')]
  [ResourceSuffix('post', '/')]
  [ResourceSuffix('delete', '/{#CUST_NO}')]
  resCustomers: TEMSDataSetResource;
  FDConnection1: TFDConnection;
end;
```

#### Changing the default alphabet and length on RADServer.ini

```ini
[Server.Sqids]
;# The following options control URL parameters Sqids decoding
;#
;# Optional alphabet for Sqids decoding
Alphabet=
;# Optional minimal hash length for Sqids decoding
MinHashLength=0
```

#### Connecting to a RAD Server instance using Sqids

Using the component EMSServer properties allows to define the _Alphabet_ and _MinHashLength_ defined in RAD Server. To specify which endpoints are encoded it requires to specify it in the _TRESTRequest.Resource_.

```pascal
BackendEndpoint1.ResourceSuffix := '/{#CUST_NO}';
```

## Prerequisites

For compiling this project you will need:

- Delphi 12 Athens+
- InterBase 2020+ with the _employee.gdb_ database

#### Clone the repo

```sh
git clone https://github.com/azapater/sqids-radserver.git
```

## Contact

- Twitter - [@antoniozapater](https://x.com/antoniozapater)
- LinkedIn - [@azapater](https://www.linkedin.com/in/azapater)

Repo Link: [https://github.com/azapater/sqids-radserver](https://github.com/azapater/sqids-radserver)

<!-- ACKNOWLEDGMENTS -->

[sqids-url]: https://sqids.org
[product-screenshot]: https://i0.wp.com/blogs.embarcadero.com/wp-content/uploads/2023/12/VCLSqids_0boqWfJpSd-1694966.png?resize=768%2C870&ssl=1
