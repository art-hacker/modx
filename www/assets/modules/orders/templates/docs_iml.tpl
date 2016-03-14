<tr>
  <td>[+id+]</td>
  <td data-name='Дата ожидания'>[+expectdate+]</td>
  <td data-name='Время'>[+senttimeFrom+]</td>
  <td data-name='Время'>[+senttimeTo+]</td>
  <td data-name='Город'>[+city+]</td>
  <td data-name='Адрес/ПВЗ'>[+address+][+pickup+]</td>
  <td data-name='Имя'>[+fullname+]</td>
  <td data-name='Телефон'>[+phone+]</td>
  <td>[+price+] руб.</td>
  <td style='padding:0'><textarea type='text' name='data[[+id+]][note]'>[+note+]</textarea></td>
  <td>
    <input type='text' name='data[[+id+]][service]' size='4' value='[+service+]'/>
    <input type='hidden' name='data[[+id+]][id]' value='[+id+]'/>
    <input type='hidden' name='data[[+id+]][fullname]' value='[+fullname+]'/>
    <input type='hidden' name='data[[+id+]][address]' value='[+address+]'/>
    <input type='hidden' name='data[[+id+]][pickup]' value='[+pickup+]'/>
    <input type='hidden' name='data[[+id+]][expectdate]' value='[+date_flip_args:expectdate:Y-m-d+]'/>
    <input type='hidden' name='data[[+id+]][senttimeFrom]' value='[+senttimeFrom+]'/>
    <input type='hidden' name='data[[+id+]][senttimeTo]' value='[+senttimeTo+]'/>
    <input type='hidden' name='data[[+id+]][city]' value='[+city+]'/>
    <input type='hidden' name='data[[+id+]][phone]' value='[+phone+]'/>
    <input type='hidden' name='data[[+id+]][price]' value='[+price+]'/>
    <input type='hidden' name='data[[+id+]][barcode]' value='[+barcodeStr+]'/>
  </td>
  <td><input style='width:28px' type='number' name='data[[+id+]][volume]' min="1" value='1'/></td>
</tr>
