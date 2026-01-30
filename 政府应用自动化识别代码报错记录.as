运行报错：
	1、捕获响应时出错: 'function' object has no attribute 'get'
	2、C:\Users\ruijie\AppData\Local\Programs\Python\Python310\lib\site-packages\urllib3\connectionpool.py:1097: InsecureRequestWarning: Unverified HTTPS request is being made to host '192.168.44.1'. Adding certificate verification is strongly advised. See: https://urllib3.readthedocs.io/en/latest/advanced-usage.html#tls-warnings
  warnings.warn(
  3、Exception ignored in: <function _ProactorBasePipeTransport.__del__ at 0x00000276C27C6710>
Traceback (most recent call last):
  File "C:\Users\ruijie\AppData\Local\Programs\Python\Python310\lib\asyncio\proactor_events.py", line 115, in __del__
    _warn(f"unclosed transport {self!r}", ResourceWarning, source=self)
  File "C:\Users\ruijie\AppData\Local\Programs\Python\Python310\lib\asyncio\proactor_events.py", line 79, in __repr__
    info.append(f'fd={self._sock.fileno()}')
  File "C:\Users\ruijie\AppData\Local\Programs\Python\Python310\lib\asyncio\windows_utils.py", line 102, in fileno
    raise ValueError("I/O operation on closed pipe")
ValueError: I/O operation on closed pipe
	4、点击链接时出错: ElementHandle.click: Timeout 30000ms exceeded.
Call log:
  - attempting click action
    2 × waiting for element to be visible, enabled and stable
      - element is not stable
    - retrying click action
    - waiting 20ms
    - waiting for element to be visible, enabled and stable
    - element is not stable
  2 × retrying click action
      - waiting 100ms
      - waiting for element to be visible, enabled and stable
      - element is visible, enabled and stable
      - scrolling into view if needed
      - done scrolling
      - element is outside of the viewport
  43 × retrying click action
       - waiting 500ms
       - waiting for element to be visible, enabled and stable
       - element is visible, enabled and stable
       - scrolling into view if needed
       - done scrolling
       - element is outside of the viewport
  2 × retrying click action
      - waiting 500ms
      - waiting for element to be visible, enabled and stable
      - element is not stable
    - retrying click action
      - waiting 500ms
      - waiting for element to be visible, enabled and stable
      - element is visible, enabled and stable
      - scrolling into view if needed
      - done scrolling
      - element is outside of the viewport
  8 × retrying click action
      - waiting 500ms
      - waiting for element to be visible, enabled and stable
      - element is visible, enabled and stable
      - scrolling into view if needed
      - done scrolling
      - element is outside of the viewport
  - retrying click action
    - waiting 500ms
	5、未识别到应用？
	6、
	❌ 点击链接时出错: ElementHandle.get_attribute: Execution context was destroyed, most likely because of a navigation
	Call log:
	  - waiting for locator(":scope")

	❌ 点击链接时出错: ElementHandle.get_attribute: Execution context was destroyed, most likely because of a navigation
	Call log:
	  - waiting for locator(":scope")
	  
	  
	  
	7、
	  ❌ 访问网站时出错: Page.goto: Timeout 60000ms exceeded.
	Call log:
	navigating to "https://bhutan.travel/", waiting until "networkidle"