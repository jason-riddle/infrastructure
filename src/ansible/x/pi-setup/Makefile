apply:
	ansible-playbook main.yml --ask-pass --ask-become-pass

facts:
	ansible all --module-name setup --tree /tmp/facts.d/ --ask-pass

ping:
	ansible all --module-name ping --ask-pass

hostname:
	ansible all --module-name command --args "hostname" --ask-pass
