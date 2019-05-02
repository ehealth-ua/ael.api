searchNodes=[{"ref":"Ael.Rpc.html","title":"Ael.Rpc","type":"module","doc":"This module contains functions that are called from other pods via RPC."},{"ref":"Ael.Rpc.html#signed_url/1","title":"Ael.Rpc.signed_url/1","type":"function","doc":"Create signed url from params Examples iex&gt; Ael.Rpc.signed_url(%{ &quot;action&quot; =&gt; &quot;PUT&quot;, &quot;bucket&quot; =&gt; &quot;declarations-dev&quot;, &quot;content_type&quot; =&gt; &quot;application/pdf&quot;, &quot;resource_id&quot; =&gt; &quot;f7f817b2-3134-4625-b87d-e2d7fc8e9b90&quot;, &quot;resource_name&quot; =&gt; &quot;signed_content&quot; }) {:ok, %{ action: &quot;PUT&quot;, bucket: &quot;declarations-dev&quot;, expires_at: &quot;2019-05-01T22:38:35Z&quot;, inserted_at: #DateTime&lt;2019-05-01 22:28:35.391988Z&gt;, resource_id: &quot;f7f817b2-3134-4625-b87d-e2d7fc8e9b90&quot;, resource_name: &quot;signed_content&quot;, secret_url: &quot;https://storage.googleapis.com/declarations-dev/f7f817b2-3134-4625-b87d-e2d7fc8e9b90/signed_content?GoogleAccessId=ael-dev@ehealth-162117.iam.gserviceaccount.com&amp;Expires=1556750315&amp;Signature=LRS1GJxEVeFtGEHicLP02eTyq3QUD4dSwqN9iGKcUzKBdNmmGh50AyreH%2FSsZenZiZmhbjqfMyUGuCZof8Lq59dFe0d3EPJInzxfhuYDKvlVkGjKLCeeVlgJIFY3DCUpZyOMZfEXgZDV1aFYUggBrVCaU3fRDFYR0evs1CXPe3TJYzYqs5B7enNGIG8Z77AWAOUQdASrDzw4ubrB7FKLB6nw9aD7nXa1zC%2F0%2BF6TLMwk6qQlKo4U93CGccPuPfOMeRM6gUYtFWSWELbftMspkNW0qF99lgCJpMNMHEQcNlBotaA4djq19am8SJJkfs1FNRifNgPgbDViOrWXThbhBQ%3D%3D&quot; }}"},{"ref":"Ael.Rpc.html#t:secret/0","title":"Ael.Rpc.secret/0","type":"type","doc":""}]