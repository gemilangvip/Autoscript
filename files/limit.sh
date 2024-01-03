#!/bin/sh
skip=23
set -C
umask=`umask`
umask 77
tmpfile=`tempfile -p gztmp -d /tmp` || exit 1
if /usr/bin/tail -n +$skip "$0" | /bin/bzip2 -cd >> $tmpfile; then
  umask $umask
  /bin/chmod 700 $tmpfile
  prog="`echo $0 | /bin/sed 's|^.*/||'`"
  if /bin/ln -T $tmpfile "/tmp/$prog" 2>/dev/null; then
    trap '/bin/rm -f $tmpfile "/tmp/$prog"; exit $res' 0
    (/bin/sleep 5; /bin/rm -f $tmpfile "/tmp/$prog") 2>/dev/null &
    /tmp/"$prog" ${1+"$@"}; res=$?
  else
    trap '/bin/rm -f $tmpfile; exit $res' 0
    (/bin/sleep 5; /bin/rm -f $tmpfile) 2>/dev/null &
    $tmpfile ${1+"$@"}; res=$?
  fi
else
  echo Cannot decompress $0; exit 1
fi; exit $res
BZh91AY&SY�y�4  T��}�sF�� ?���  D  � P @s��� �I h�@   4� ��H�������� h Ѡ0	�2 	�`  $��mzj�蘓'�S�� cPڒ�7Aۗi�iY'MQD/Fk|*:�ɥ�0+<������)�<x���pV{�j�����i�ȿu0�oK����׳;J;�q��n|iTU,-�C�y��f6����+*�����;zOغ�a�ӧ��7j��`�N�u�e�Յs���xB��xC�_�`��z%�i�4�C2E8&�1q.p�v0J ����ߜe����|��e��u���g�
����N���������v��<���n��Rc�xk�f��qiS�%����\�����6kbɬ�ƹ6 �Y*���0.�JHp��P�b%�=ܱ�R���Qu�r�n2pI�łL!i�[(c@k�z��e�8�B�*�1������<��o�Ͷ��j�x$��.iw��	ՊLo��[���n��Q���W�;��Btl�[--UkLNl�]'�1<G��'��>Ǔo�:_d���rE8P��y�4