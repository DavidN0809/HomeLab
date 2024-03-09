
import requests
import threading
import time

def send_search_query(query, url="http://192.168.68.133:7006/"):
    try:
        start_time = time.time()
        response = requests.get(url, params={'q': query}, timeout=60)
        latency = time.time() - start_time
        return response.status_code, latency
    except requests.RequestException as e:
        return 0, 0  # Return 0 status and 0 latency in case of an exception

def load_test(duration_seconds, rate_per_second):
    """
    Perform a load test for a specified duration and rate.
    """
    end_time = time.time() + duration_seconds
    total_requests = 0
    successful_requests = 0

    while time.time() < end_time:
        for _ in range(rate_per_second):
            # Customize your query as needed
            query = "example search"
            status, _ = send_search_query(query)  # Unpacking the tuple
            if status == 200:
                successful_requests += 1
            total_requests += 1
            time.sleep(1 / rate_per_second)

    return total_requests, successful_requests

def concurrent_load_test(same_query=True):
    threads = []
    latencies = []
    for i in range(5):
        query = "example search" if same_query else f"unique search {i}"
        thread = threading.Thread(target=lambda q, lst: lst.append(send_search_query(q)), args=(query, latencies))
        threads.append(thread)
        thread.start()

    for thread in threads:
        thread.join()

    return latencies

def staggered_load_test():
    latencies = []
    for _ in range(5):
        status, latency = send_search_query("example search")
        latencies.append((status, latency))
        time.sleep(1)
    
    return latencies

def calculate_average_latency(latencies):
    total_latency = sum(latency for _, latency in latencies)
    return total_latency / len(latencies) if latencies else 0

# Customize these values
DURATION_SECONDS = 60  # 1 minute
REQUEST_RATE = 1       # 1 request per second

# Original Load Test
total, successful = load_test(DURATION_SECONDS, REQUEST_RATE)
print(f"Original Load Test - Total requests: {total}, Successful requests: {successful}")

# Concurrent Load Test with Same Request
latencies = concurrent_load_test()
avg_latency = calculate_average_latency(latencies)
print(f"Concurrent Load Test with Same Request - Average Latency: {avg_latency}")

# Staggered Load Test
latencies = staggered_load_test()
avg_latency = calculate_average_latency(latencies)
print(f"Staggered Load Test - Average Latency: {avg_latency}")

# Concurrent Load Test with Unique Requests
latencies = concurrent_load_test(same_query=False)
avg_latency = calculate_average_latency(latencies)
print(f"Concurrent Load Test with Unique Requests - Average Latency: {avg_latency}")
