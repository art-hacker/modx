<tr class='edit [+class+]'>
  <td>
    <label><input type='checkbox' name='allow_[+n+]' [+allowed_checked+] value='1'/>
    <span>✓</span>
    </label>
  </td>
  <td>
    <input type='hidden' name='p_id[[+n+]]' value='[+id+]'/>
    <input type='text' name='p_name[[+n+]]' value='[+pagetitle+]'/>
  </td>
  <td>
    <input type='text' name='p_count[[+n+]]' value='[+amount+]'/>
  </td>
  <td>
    <input type='text' name='p_price[[+n+]]' value='[+unit_price+]'/>
  </td>
  <td>
    <label><input type='checkbox' name='delete_[+n+]' value='1'/>
    <span>✘</span>
    </label>
  </td>
</tr>
<tr class='view [+class+]'>
  <td>[+alias+]</td>
  <td><a href='[+url+]' target='_blank'>[+pagetitle+]</a></td>
  <td>[+amount+] шт.</td>
  <td>[+price+] руб.</td>
</tr>