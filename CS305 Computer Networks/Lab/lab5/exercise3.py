import dns.resolver

resolver = dns.resolver.Resolver()
resolver.flags = 0x0000 # 0x0100
dns.resolver.default_resolver = resolver
url = input('Enter URL: ')
rd = 0
for qtype in 'A', 'AAAA', 'CNAME', 'MX', 'NS':
    answer = dns.resolver.resolve(url, qtype,  raise_on_no_answer=False)
    if answer.rrset is not None:
        auth = answer.response.flags & 0b00000001 != 0
        print(answer.rrset, end=' ')
        if auth:
            print('Authenticated')
        else:
            print('Non-Authenticated')
