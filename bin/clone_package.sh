yum install -y $1 
rpm -ql $1 | tar cf $1.tar -T -
tar xf $1.tar
rm $1.tar

